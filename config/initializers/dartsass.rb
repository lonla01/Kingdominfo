Rails.application.config.dartsass.builds = {
    "style.scss"       => "style.css"
}

Rails.application.config.dartsass.build_options << " --quiet-deps"