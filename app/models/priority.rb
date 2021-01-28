class Priority < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '低' },
    { id: 3, name: '中' },
    { id: 4, name: '高' }
  ]
end