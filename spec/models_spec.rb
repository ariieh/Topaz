require 'spec_helper'
require 'rails_helper'

describe Article do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:author) }
end

describe User do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should ensure_length_of(:password).is_at_least(6) }
end

describe Comment do
  it { should validate_presence_of(:text) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:article) }
end

describe Tag do
  it { should validate_presence_of(:name) }
end