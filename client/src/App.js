import React from 'react';
import './App.css';
import SkillSelect from './components/SkillSelect'
import CharClassSelect from './components/CharClassSelect';

const App = () => {
  return (
    <div className="App">
      <h2>DnD Character Dashboard</h2>
      <SkillSelect label="skill" />
      <CharClassSelect />
    </div>
  );
}

export default App;