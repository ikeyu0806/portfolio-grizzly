<template>
  <div v-html="compiledMarkdown"></div>
  <!-- <p>hello</p> -->
</template>

<script>
import marked from 'marked';

export default {
  props: ['value'],
  computed: {
    compiledMarkdown: function () {
      return marked(this.value, { sanitize: true })
    }
  }
}
</script>
