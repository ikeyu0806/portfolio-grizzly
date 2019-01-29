<template>
  <p>Hello! </p>
</template>

<script>
import marked from 'marked';
import _ from 'lodash';

export default {
  template: '<div>hello</div>',
  mounted: function () {
    console.log("マウントされたよ");
  },
  // el: '#editor',
  name: 'vue-test',
  data: {
      testVal: 'Hello World!'
  }
};
</script>
