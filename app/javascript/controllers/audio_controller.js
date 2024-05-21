import { Controller } from "@hotwired/stimulus";
import { Howl, Howler } from 'howler';
import Swal from 'sweetalert2';

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
    // unmute the sound
    const index = event.currentTarget.dataset.index;
    const sound = this.sounds[index];
    sound.mute(!sound.mute());

    // get the sounds id
    const soundId = event.currentTarget.dataset.soundId;
    // either add or remove the sound id from the selection
    if (this.selections.includes(soundId)) {
      // removing from selection
      const selectionIndex = this.selections.indexOf(soundId);
      this.selections.splice(selectionIndex, 1)
    } else {
      // adding to selection
      this.selections.push(soundId);
    }

    // get the correct sounds
    const correctSounds = this.correctValue.split(', ');

    const selectionCorrect = correctSounds.includes(soundId);
    if (selectionCorrect) {
      Swal.fire({
        title: "Correct selection!",
        text: "You have selected the correct sound.",
        icon: "success",
        width: 300,
        padding: "3em",
        color: "#716add",
        background: "#fff url(/images/trees.png)",
        backdrop: `
          rgba(0,0,123,0.4)
          url("/images/nyan-cat.gif")
          left top
          no-repeat
        `
      });
    } else {
      Swal.fire({
        title: "Wrong selection!",
        text: "You have selected the wrong sound.",
        icon: "error",
        width: 300,
        padding: "3em",
        color: "#716add",
        background: "#fff url(/images/trees.png)",
        backdrop: `
          rgba(0,0,123,0.4)
          url("/images/nyan-cat.gif")
          left top
          no-repeat
        `
      });
    }
    if (this.selections.length === 4 && correctSounds.every((sound) => this.selections.includes(sound))) {
      // show winnign message
      alert('you win!')
    }

  }

  startJumping() {
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
