import { Controller } from "@hotwired/stimulus";
import { Howl, Howler } from 'howler';

// Connects to data-controller="audio"
export default class extends Controller {
  static values = {
    urls: Array, // Assume this comes as an array of URLs
    correct: String,
    id: String
  }

  static targets = ["avatar", "button"]

  connect() {
    console.log("hello");
    console.log(this.correctValue);
    this.sounds = this.urlsValue.map(url => new Howl({
      src: [url],
      volume: 1,
      loop: true,
      mute: true
    }));
    this.isPlaying = false; // Track whether the sounds are playing
    this.selections = [];
    this.activeTypes = [];
  }

  playAll() {
    if (this.isPlaying) {
      this.stopAll();
    } else {
      this.sounds.forEach((sound) => sound.play());

      this.startJumping();
      this.buttonTarget.textContent = "Stop";
    }
    this.isPlaying = !this.isPlaying;
  }

  stopAll() {
    this.sounds.forEach((sound) => sound.stop());
    this.stopJumping();
    this.buttonTarget.textContent = "Start";
  }

  unmute(event) {
    // get the sounds id
    const soundId = event.currentTarget.dataset.soundId;
    // get the sounds type
    const soundType = event.currentTarget.dataset.soundType;

    // check if there is already a sound with this type playing
    if (this.activeTypes.includes(soundType)) {
      // if so check if we have pressed on the same sound (removing it)
      if (this.selections.includes(soundId)) {
        // this scary code is how we remove items from arrays in js
        // we first find the index of that item in the array and save it
        const typeIndex = this.activeTypes.indexOf(soundType);
        // we then splice (remove) 1 item from the array at the given index we know our item to be at
        this.activeTypes.splice(typeIndex, 1);
      } else {
        // if we havent it means we are trying to add another sound of the same type, nonono
        return;
      }
    } else {
      // add the sound type to active types to track which types are active
      this.activeTypes.push(soundType);
    }

    // either add or remove the sound id from the selection
    if (this.selections.includes(soundId)) {
      // removing from selection
      event.currentTarget.classList.remove('active');
      const selectionIndex = this.selections.indexOf(soundId);
      this.selections.splice(selectionIndex, 1)
    } else {
      // adding to selection
      event.currentTarget.classList.add('active');
      this.selections.push(soundId);
    }

    // unmute the sound element at the given index
    const index = event.currentTarget.dataset.index;
    const sound = this.sounds[index];
    sound.mute(!sound.mute());

    // split the correct sounds string into an array of ids
    const correctSounds = this.correctValue.split(', ');
    // check if our selected sound is included in that 'correct' sounds
    const selectionCorrect = correctSounds.includes(soundId);

    // process one of two messages based on whether our selection is 'correct'
    if (selectionCorrect) {
      // show a  correct message
    } else {
      // show a wrong mesage
    }

    // check if we have 4 selections, and if they are all in the correct sounds (WIN)
    if (this.selections.length === 4 && correctSounds.every((sound) => this.selections.includes(sound))) {
      // show winnign message
      alert('you win!')
    }

  }

  startJumping() { // start jumping
    this.avatarTargets.forEach(avatar => {
      avatar.classList.add('jump');
    });
  }

  stopJumping() {
    this.avatarTargets.forEach(avatar => {
      avatar.classList.remove('jump');
    });
  }
}
