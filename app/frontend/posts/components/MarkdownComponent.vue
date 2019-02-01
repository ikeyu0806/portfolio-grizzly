<template>
  <div v-html="compiled"></div>
</template>

<script>
import marked from 'marked';
import _ from 'lodash';

export default {
  data: function (){
      return {
        compiled: ''
      }
  },
  props: ['value'],
  methods: {
    compileMarkdown: function () {
      this.compiled = marked(this.value, { sanitize: true } )
    }
  },
  watch: {
    value: function (newPost, oldPost) {
      this.debounced()
    }
  },
  created: function() {
    this.compiled = marked(this.value, { sanitize: true } )
    this.debounced = _.debounce(this.compileMarkdown, 300)
  }
}
</script>
