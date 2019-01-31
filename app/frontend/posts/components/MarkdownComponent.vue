<template>
  <div v-html="compiledMarkdown"></div>
  <!-- <p>hello</p> -->
</template>

<script>
import marked from 'marked';

export default {
  // propsを定義
  // v-bind:propsの名前
  props: ['value'],
  computed: {
    compiledMarkdown: function () {
      return marked(this.value, { sanitize: true })
    }
  }
}
</script>
