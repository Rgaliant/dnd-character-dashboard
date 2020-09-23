import React from 'react';

import SimpleSelect from './SimpleSelect';

const defaultSelectData = {
  model: 'Race',
  select: ['id', 'name']
};

const RaceSelect = props => (
  <SimpleSelect
    selectData={{ ...defaultSelectData, ...props.defaultSelectData }}
    label={props.label}
    placeholder={'Select...'}
    name={'race_select'}
    onSelect={props.onChange}
    {...props}
  />
);

export default RaceSelect;

RaceSelect.defaultProps = {
  label: 'Race'
};