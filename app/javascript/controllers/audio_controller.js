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
      mute: true,
      // html5: true,
      // preload: true
    }));
    this.isPlaying = false; // Track whether the sounds are playing
    this.selections = [];
    this.activeTypes = [];
    // this.stopWin();
  }

  disconnect() {
    this.stopAll();
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

  stopWin() {
    // window.location.reload();
    this.sounds.forEach((sound) => sound.stop());
    console.log(this.sounds);
    // this.stopJumping();
    // this.buttonTarget.textContent = "Start";
  }

  async unmute(event) {
    // get the sound id
    const soundId = event.currentTarget.dataset.soundId;
    // get the sound type
    const soundType = event.currentTarget.dataset.soundType;

    // check if the user has already clicked this avatar
    if (this.selections.includes(soundId)) {
      // Toggle the mute state and selection state without showing SweetAlert
      const index = event.currentTarget.dataset.index;
      const sound = this.sounds[index];
      sound.mute(!sound.mute());

      // toggle active class
      event.currentTarget.classList.toggle('active');

      // remove or add soundId from selections
      const selectionIndex = this.selections.indexOf(soundId);
      if (selectionIndex !== -1) {
        this.selections.splice(selectionIndex, 1);
        // remove the sound type from activeTypes if it's no longer selected
        const typeIndex = this.activeTypes.indexOf(soundType);
        if (typeIndex !== -1) {
          this.activeTypes.splice(typeIndex, 1);
        }
      } else {
        this.selections.push(soundId);
        // add the sound type to activeTypes if it's not already there
        if (!this.activeTypes.includes(soundType)) {
          this.activeTypes.push(soundType);
        }
      }

      // split the correct sounds string into an array of ids
      const correctSounds = this.correctValue.split(', ');

      // check if we have 4 selections, and if they are all in the correct sounds (WIN)
      if (this.selections.length === 4 && correctSounds.every(sound => this.selections.includes(sound))) {
        alert('You win!');
      }

      return; // Exit early
    }

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
        // if we haven't it means we are trying to add another sound of the same type, nonono
        return;
      }
    } else {
      // add the sound type to active types to track which types are active
      this.activeTypes.push(soundType);
    }

    // add or remove the sound id from the selection
    if (this.selections.includes(soundId)) {
      // removing from selection
      event.currentTarget.classList.remove('active');
      const selectionIndex = this.selections.indexOf(soundId);
      this.selections.splice(selectionIndex, 1);
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

    // check if we have 4 selections, and if they are all in the correct sounds (WIN)
    if (this.selections.length === 4 && correctSounds.every(sound => this.selections.includes(sound))) {
      fetch("/avatars").then((resp) => resp.json()).then((data) => {
        const avatarsHTML = data.avatars;
        Swal.fire({
          title: "You win!",
          html: `
          <div>
            <p>Congratulations! You're a musical genius!</p>
            <p>Check out these avatars:</p>
            <div class="row">
              ${avatarsHTML}
            </div>
          </div>`,
          icon: "success",
          width: 400,
          padding: "3em",
          color: "#fff",
          background: "#8e44ad url(/images/nyan-cat.gif) no-repeat center top",
          backdrop: `
            rgba(0,0,123,0.4)
            url("/images/confetti.gif")
            left top
            no-repeat
          `,
          showConfirmButton: false,
          // timer: 5000,
          timerProgressBar: true
        });
        return; // Exit early to avoid showing the "Correct selection" message
      })
      // this.stopWin();
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
