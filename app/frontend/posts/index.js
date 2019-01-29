import Dispatcher from 'dispatcher';
import form from './form';

const dispatcher = new Dispatcher({
  routes: {
    form
  },
});
dispatcher.run();
