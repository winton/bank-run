# Ensure filenames are using the name defined in package.json.
# https://github.com/jdavis/grunt-rename

module.exports = (grunt) ->

  grunt.config.data.rename =
    bin_path:
      src : "bin/bank-run"
      dest: "bin/<%= pkg.name %>"
    src_directory:
      src : "src/bank-run"
      dest: "src/<%= pkg.name %>"
    src_path:
      src : "src/bank-run.coffee"
      dest: "src/<%= pkg.name %>.coffee"
    test_directory:
      src : "test/bank-run"
      dest: "test/<%= pkg.name %>"
    test_path:
      src : "test/bank-run.coffee"
      dest: "test/<%= pkg.name %>.coffee"

  grunt.loadNpmTasks "grunt-rename"