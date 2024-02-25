extern crate grapheme_to_phoneme;
use grapheme_to_phoneme::Model;
use once_cell::sync::Lazy;
use std::panic;
use std::sync::Mutex;

static MODEL: Lazy<Mutex<Model>> = Lazy::new(|| {
    let model = Model::load_in_memory().unwrap();
    Mutex::new(model)
});

#[rustler::nif]
fn phoneme_strs(string: &str) -> Vec<&str> {
    match MODEL.lock() {
        Err(e) => {
            println!("Arpabex model error {:#?}\n", e);
            return vec![];
        }
        Ok(model) => {
            let result = panic::catch_unwind(|| {
                return model.predict_phonemes_strs(string);
            });
            match result {
                Ok(Ok(res)) => {
                    return res;
                }
                _ => {
                    return vec![];
                }
            }
        }
    }
}

rustler::init!("Elixir.Arpabex.Native", [phoneme_strs]);
