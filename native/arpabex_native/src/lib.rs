extern crate grapheme_to_phoneme;
use grapheme_to_phoneme::Model;
use once_cell::sync::Lazy;
use std::sync::Mutex;

static MODEL: Lazy<Mutex<Model>> = Lazy::new(|| {
    let model = Model::load_in_memory().unwrap();
    Mutex::new(model)
});

#[rustler::nif]
fn phoneme_strs(string: &str) -> Vec<&str> {
    return MODEL.lock().unwrap().predict_phonemes_strs(string).unwrap();
}

rustler::init!("Elixir.Arpabex.Native", [phoneme_strs]);
