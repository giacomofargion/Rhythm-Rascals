import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="audio"
export default class extends Controller {
  async play() {
    await Tone.start();
    console.log("Audio is playing");
    // Add your Tone.js code to play audio here
    // For example:
    const player = new Tone.Player(
      "http://localhost:3000/audio/beat.wav"
    ).toDestination();
    Tone.loaded().then(() => {
      player.start();
    });
  }
}
