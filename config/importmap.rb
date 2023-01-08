# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/custom_actions", under: "custom_actions"
pin "sortablejs" # @1.15.0
pin "alpine-turbo-drive-adapter" # @2.0.0
pin "alpinejs" # @3.10.5
