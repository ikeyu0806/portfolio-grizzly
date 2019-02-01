import MarkdownComponent from './components/MarkdownComponent';

export default {
  components: {
    MarkdownComponent
  },
  methods: {
    update: _.debounce(function (e) {
      this.input = e.target.value
    }, 300)
  }
}
