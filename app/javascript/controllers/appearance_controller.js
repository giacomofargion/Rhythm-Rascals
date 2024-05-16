// app/javascript/controllers/appearance_controller.js
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="appearance"
export default class extends Controller {
  static targets = ["title", "avatarImage", "description", "avatarDescription"]

  connect() {
    this.delayedAppearance();
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
    }, 2000);
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
    }, 5); // Adjust typing speed here (increased speed)
  }

  showAvatars() {
    this.avatarImageTargets.forEach((avatar, index) => {
      setTimeout(() => {
        avatar.style.transition = 'opacity 1s';
        avatar.style.opacity = 1;
        this.showAvatarDescription(index);
      }, index * 300); // Adjust delay between each avatar here
    });
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
    }, 10); // Adjust typing speed here
  }
}
