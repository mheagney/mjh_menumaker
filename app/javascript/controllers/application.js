import { Application } from "@hotwired/stimulus"
import Alpine from "alpinejs"
import Sortable from "sortablejs"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application
window.Alpine = Alpine
window.Sortable = Sortable
Alpine.start()

export { application }
