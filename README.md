# Listening test with music and speech stimuli

Listening test used in my MA thesis, for assessing correlation between
perception of speech and musical stimuli. The material and speech stimuli are
in Czech. The test is implemented using the Praat linguistic research
environment.

You can read about the purpose of the test and the results obtained in
[my thesis](./Lukeš-MA_thesis.pdf) (currently still in draft status & Czech
only; English abstract coming up!).

## Quick setup

1. Download and unpack into the directory of your choice.
2. Create a directory named `results` inside the root directory of the test.
3. Read the general guidelines in `spolecne_pokyny.html`.
4. Load the file `test.mfc` into Praat and start the test. Answer the
   questions.
5. Collect the results by running the `collect_results.praat` script. This will
   create a `.csv` file in the `results` directory with your results.

## Results collected for my thesis

The results I collected for my thesis are available in anonymized form in the
`results_anom` directory, one subject per `.csv` file. If you want to play
around with them (e.g. in `R` or some other stat software) but can't figure out
the format, drop me a line on github and I'll try to provide some basic
orientation :)

## Credits

The music stimuli were created with the help of the
[leipzig](https://github.com/ctford/leipzig) Clojure library by ctford,
converted to midi using the Python
[MIDIUtil](https://code.google.com/p/midiutil/) library and rendered into WAV
files using [TiMidity++](http://timidity.sourceforge.net/) and the
`FluidR3_GM.sf2` soundfont.
