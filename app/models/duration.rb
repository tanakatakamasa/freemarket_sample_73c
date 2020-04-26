class Duration < ActiveHash::Base
  self.data = [
      {id: 1, name: '1~2日で発送'}, 
      {id: 2, name: '2~3日で発送'}, 
      {id: 3, name: '3~4日で発送'}
  ]
end