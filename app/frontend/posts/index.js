import Dispatcher from 'dispatcher';
import form from './form';
import show from './show';

const dispatcher = new Dispatcher({
  routes: {
    form,
    show
  },
});
dispatcher.run();
