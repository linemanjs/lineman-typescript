module.exports = (lineman) ->
  files:
    typescript:
      app: "app/js/**/*.ts"
      spec: "spec/**/*.ts"
      specHelpers: "spec/helpers/**/*.ts"
      generated: "generated/js/app.ts.js"
      generatedSpec: "generated/js/spec.ts.js"
      generatedSpecHelpers: "generated/js/spec-helpers.ts.js"

  config:
    loadNpmTasks: lineman.config.application.loadNpmTasks.concat('grunt-typescript')

    prependTasks:
      common: lineman.config.application.prependTasks.common.concat('typescript')

    typescript:
      compile:
        files:
          "<%= files.typescript.generated %>": "<%= files.typescript.app %>"
          "<%= files.typescript.generatedSpec %>": "<%= files.typescript.spec %>"
          "<%= files.typescript.generatedSpecHelpers %>": "<%= files.typescript.specHelpers %>"

    watch:
      typescript:
        files: "<%= files.typescript.app %>"
        tasks: ["typescript", "concat_sourcemap:js"]
