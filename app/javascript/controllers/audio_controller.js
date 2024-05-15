import { Controller } from "@hotwired/stimulus";
import {Howl, Howler} from 'howler';

export default class extends Controller {
static targets = ["audioAvatar"]

startTransport() {
  this.play1()
  this.play2()
}


  play1() {
    const sounds = new Howl({
      src: '/assets/audio1.mp3',
      loop: true,
      volume: 0,
    });
    sounds.play();
  }

  play2() {
    const sounds = new Howl({
      src: '/assets/audio2.mp3',
      loop: true,
      volume: 0,
    });
    sounds.play();
  }
}
