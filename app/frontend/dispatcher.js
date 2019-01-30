import Vue from 'vue';

export default class Dispatcher {
  constructor(options = {}) {
    this.routes = options.routes;
    this.handlers = [];

    Dispatcher.bindRoutes.call(this);
  }

  route(route, options) {
    this.handlers.push({ route, options });
  }

  run() {
    let root;
    let options;

    this.handlers.forEach((handler) => {
      const element = document.querySelector(Dispatcher.SELECTORS[handler.route]);
      if (element) {
        root = element.querySelector('section');
        options = handler.options; // eslint-disable-line prefer-destructuring
      }
    });

    if (options) {
      (options.plugins || []).forEach((plugin) => {
        if (Array.isArray(plugin)) {
          Vue.use(plugin[0], plugin[1]);
        } else {
          Vue.use(plugin);
        }
      });

      window.app = new Vue(Object.assign(
        {
          el: root,
        },
        options,
      ));
    }
    // window.app = new Vue(Object.assign(
    //   {
    //     el: '#edit',
    //   },
    //   options,
    // ));
  }

  static bindRoutes() {
    if (this.routes === undefined) {
      return;
    }

    Object.keys(this.routes).forEach(key => this.route(key, this.routes[key]));
  }

  static get SELECTORS() {
    return {
      list: '#index',
      form: '#new, #edit, #create, #update',
      newForm: '#new, #create',
      editForm: '#edit, #update',
    };
  }
}
