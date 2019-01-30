import MarkdownEditorComponent from './components/MarkdownEditorComponent';
import marked from 'marked';
import _ from 'lodash';

export default {
  data: {
    input: '# hello'
  },
  components: {
    MarkdownEditorComponent
  },
  computed: {
    compiledMarkdown: function () {
      return marked(this.input, { sanitize: true })
    }
  },
  methods: {
    update: _.debounce(function (e) {
      this.input = e.target.value
    }, 300)
  }
}
