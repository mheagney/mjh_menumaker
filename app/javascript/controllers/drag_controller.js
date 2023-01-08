import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
    connect() {
        this.sortable = Sortable.create(
            this.element, {
            handle: '.handle',
            onEnd: this.updatePosition.bind(this)
        }
        )
    }

    updatePosition(event) {
        let id = event.item.dataset.id
        let menu_id = event.item.dataset.menu
        let section_id = event.item.dataset.section
        let url = this.data.get("url").replace(":id", id).replace(":menu_id", menu_id).replace(":section_id", section_id)
        console.log(url)
        let data = JSON.stringify({

            id: id,
            position: event.newIndex + 1,

        });

        fetch(url, {
            method: "PATCH",
            credentials: "same-origin",
            headers: {
                "X-CSRF-Token": this.getMetaValue("csrf-token"),
                "Content-Type": "application/json",
            },
            body: data,
        }).then(response => response.text())
            .then(html => Turbo.renderStreamMessage(html));
    }

    getMetaValue(name) {
        const element = document.head.querySelector(`meta[name="${name}"]`);
        return element.getAttribute("content");
    }
}