# Night Writer
### Contributor: Zachary Hazelwood
Turing BE Mod 1 Final Solo Project, Inning 2203

  This repository translates English characters into Braille from a text message that contains only english lowercase characters.

To translate, clone this repository and access the runner file within the command line:
```
$ ruby ./lib/night_writer_runner.rb message.txt braille.txt
```
`message.txt` will transform all letters into lowercase and cannot contain special characters: `[ ' , . ! ? ; ]` Line breaks will be deleted if the text contains line breaks.

Once translated, the Terminal will output the following line:
```
Created 'braille.txt' containing *n* characters.
```
*n* will be the number of characters created within the output file.
