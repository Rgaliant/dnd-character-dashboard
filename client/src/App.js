import React from 'react';
import './App.css';
import { Switch, Route } from 'react-router-dom';
import Home from './components/Home';
import Navbar from './components/Navbar';
import MasterIndex from './components/MasterIndex';
import CreateCharacter from './components/CreateCharacter';

const App = () => {
  return (
    <div className="App">
      <Navbar />
      <Switch>
        <Route exact path='/' component={Home} />
        <Route exact path='/master-index' component={MasterIndex} />
        <Route exact path='/create-character' component={CreateCharacter} />
      </Switch>
    </div>
  );
}

export default App;