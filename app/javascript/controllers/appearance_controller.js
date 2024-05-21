// app/javascript/controllers/appearance_controller.js
import { Controller } from "@hotwired/stimulus"
// import anime from 'animejs';


// Connects to data-controller="appearance"
export default class extends Controller {
  static targets = ["title", "avatarImage", "description", "avatarDescription", "howToPlayLink"]

  connect() {
    console.log("Controller connected");
    this.delayedAppearance();
    // Get the popup and link elements
    this.popup = document.getElementById("how-to-play-popup");
    this.link = document.getElementById("how-to-play-link");
    // Get the close button inside the popup
    this.closeButton = this.popup.querySelector(".how-to-play-close");

    // Bind event listeners
    this.link.addEventListener("click", this.showPopup.bind(this));
    this.closeButton.addEventListener("click", this.hidePopup.bind(this));
    window.addEventListener("click", this.handleOutsideClick.bind(this));
    // this.link.addEventListener("click", this.bounceAvatars.bind(this)); //
    console.log("Event listener added to How to Play link");
  }
  delayedAppearance() {
    setTimeout(() => {
      this.titleTarget.style.transition = 'opacity 1s, font-weight 1s';
      this.titleTarget.style.opacity = 1;
      this.titleTarget.style.fontWeight = 'bold';
      setTimeout(() => {
        this.showDescription();
      }, 1000); // Delay to show description after title appears
      this.showAvatars();
    }, 500);
  }

  showDescription() {
    this.descriptionTarget.style.opacity = 1;
    const text = this.descriptionTarget.textContent;
    this.descriptionTarget.textContent = '';
    let i = 0;
    const typingInterval = setInterval(() => {
      if (i < text.length) {
        this.descriptionTarget.textContent += text.charAt(i);
        i++;
      } else {
        clearInterval(typingInterval);
      }
    }, 10); // Adjust typing speed here (increased speed)
  }

  showAvatars() {
    const totalAvatars = this.avatarImageTargets.length;
    this.avatarImageTargets.forEach((avatar, index) => {
      setTimeout(() => {
        anime({
          targets: avatar,
          opacity: 4, // Fade in
          translateY: [-80, 0], // Bounce effect
          duration: 5000, // Animation duration
          // easing: 'easeOutElastic', // Easing function
          delay: index * 1500, // Delay between each avatar
          // complete: () => {
          //   // Trigger bounceAvatars when all avatars are done animating
          //   if (index === totalAvatars - 1) {
          //     this.bounceAvatars();
          //   }
          // }
        });
        this.showAvatarDescription(index);
      }, 2000); // Adjust initial delay here
    });
  }

  bounceAvatars() {
    console.log("Bouncing avatars...");
    this.avatarImageTargets.forEach((avatar, index) => {
      anime({
        targets: avatar,
        translateY: [-20, 0],
        duration: 500,
        easing: 'easeOutElastic',
        delay: index * 800,
        loop: true // Make the animation loop indefinitely
      });
    });
  }

    // Method to show the popup
    showPopup(event) {
      event.preventDefault();
      this.popup.style.display = "block";
      this.bounceAvatars();
      this.link.addEventListener("click", this.bounceAvatars.bind(this));
    }

    showHowToPlayLink() {
      console.log(this.howToPlayLinkTarget);
      this.howToPlayLinkTarget.style.visibility = "visible"; // Show the link
  }

    // Method to hide the popup
    hidePopup() {
      this.popup.style.display = "none";
    }

  // Method to handle clicks outside the popup
  handleOutsideClick(event) {
    if (event.target === this.popup) {
      this.hidePopup();
    }
  }

  showAvatarDescription(index) {
    const descriptionElement = this.avatarDescriptionTargets[index];
    descriptionElement.style.opacity = 1;
    const text = descriptionElement.textContent;
    descriptionElement.textContent = '';
    let i = 0;
    const typingInterval = setInterval(() => {
      if (i < text.length) {
        descriptionElement.textContent += text.charAt(i);
        i++;
      } else {
        clearInterval(typingInterval);
      }
    }, 100);
    this.showHowToPlayLink(); // Adjust typing speed here
  }
}
