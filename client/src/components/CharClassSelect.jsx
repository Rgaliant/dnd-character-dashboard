import React from 'react';

import SimpleSelect from './SimpleSelect';

const defaultSelectData = {
  model: 'CharClass',
  select: ['id', 'name']
};

const CharClassSelect = props => (
  <SimpleSelect
    selectData={{ ...defaultSelectData, ...props.defaultSelectData }}
    label={props.label}
    placeholder={'Select...'}
    name={'char_class_select'}
    {...props}
  />
);

export default CharClassSelect;

CharClassSelect.defaultProps = {
  label: 'Class'
};