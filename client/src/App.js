import React from 'react';
import './App.css';
import SkillSelect from './components/SkillSelect'

const fetchCharactersData = function () {
  fetch('/api/v1/characters')
    .then(res => res.json())
    .then((response) => { console.log("Test character response", response); })
    .catch((error) => { console.log("Error while fetching test datas", error); })
}

const App = () => {
  return (
    <div className="App">
      <h2>DnD Character Dashboard</h2>
      <SkillSelect label="skill" />
    </div>
  );
}

export default App;