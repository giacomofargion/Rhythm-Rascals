import { Controller } from "@hotwired/stimulus";
import { Howl, Howler } from 'howler';

// Connects to data-controller="audio"
export default class extends Controller {
  static values = {
    urls: Array, // Assume this comes as an array of URLs
    correct: String
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
    const index = event.currentTarget.dataset.index;
    console.log(index);
    const sound = this.sounds[index];
    sound.mute(!sound.mute());

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
