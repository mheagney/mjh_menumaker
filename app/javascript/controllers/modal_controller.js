import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    hideModal() {
        this.element.parentElement.removeAttribute("src") // it might be nice to also remove the modal SRC
        this.element.remove()
    }

    // hide modal when clicking ESC
    // action: "keyup@window->turbo-modal#closeWithKeyboard"
    closeWithKeyboard(e) {
        if (e.code == "Escape") {
            this.hideModal()
        }
    }

    // hide modal when clicking outside of modal
    // action: "click@window->turbo-modal#closeBackground"
    closeBackground(e) {
        //if (e && this.target.contains(e.target)) {
        //    return
        // }
        this.hideModal()
    }

    // hide modal on successful form submission
    // action: "turbo:submit-end->turbo-modal#submitEnd"
    submitEnd(e) {
        if (e.detail.success) {
            this.hideModal()
        }
    }
}