import marked from 'marked';
import _ from 'lodash';
import MarkdownComponent from './components/MarkdownComponent';

export default {
  // data: {
  //   input: post
  // },

  // computed: {
  //   compiledMarkdown: function () {
  //     return marked(this.post, { sanitize: true })
  //   }
  // },

  // methods: {
  //   update: _.debounce(function (e) {
  //     this.input = e.target.value
  //   }, 300)
  // }
  components: {
    MarkdownComponent
  }
}
