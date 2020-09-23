import React from 'react';

import SimpleSelect from './SimpleSelect';

const defaultSelectData = {
  model: 'SubCharClass',
  select: ['id', 'name']
};

const SubCharClassSelect = props => (
  <SimpleSelect
    selectData={{ ...defaultSelectData, ...props.defaultSelectData }}
    label={props.label}
    placeholder={'Select...'}
    name={'sub_char_class_select'}
    onSelect={props.onChange}
    {...props}
  />
);

export default SubCharClassSelect;

SubCharClassSelect.defaultProps = {
  label: 'SubClass'
};