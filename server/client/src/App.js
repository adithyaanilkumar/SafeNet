import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import NotFound from './components/Layout/NotFound';
import Landing from './components/Layout/Landing';
import './App.css';

function App() {
  return (
    <Router>
      <>
        <section>
          <Switch>
            <Route exact path='/' component={Landing} />
            <Route component={NotFound} />
          </Switch>
        </section>
      </>
    </Router>
  );
}

export default App;
