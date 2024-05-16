import { Controller } from "@hotwired/stimulus";
import {Howl, Howler} from 'howler';


// Connects to data-controller="tone"
export default class extends Controller {

    static values = {
      urls: Array // Assume this comes as an array of URLs
    }

  connect() {
    console.log("hello")
    this.sounds = this.urlsValue.map(url => new Howl({
      src: [url],
      volume: 1,
      loop: true,
      mute: true
    }));
  }

    playAll() {
      this.sounds.forEach((sound) => sound.play());
    }

    unmute(event) {
      const index = event.currentTarget.dataset.index;
      console.log(index)
      const sound = this.sounds[index];
      sound.mute(!sound.mute());
    }
  }
