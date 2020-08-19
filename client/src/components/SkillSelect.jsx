import React from 'react';

import SimpleSelect from './SimpleSelect';

const defaultSelectData = {
  model: 'Skill',
  select: ['id', 'name']
};

const SkillSelect = props => (
  <SimpleSelect
    selectData={{ ...defaultSelectData, ...props.defaultSelectData }}
    label={props.label}
    placeholder={'Select...'}
    name={'skill_select'}
    {...props}
  />
);

export default SkillSelect;

SkillSelect.defaultProps = {
  label: 'Skills'
};