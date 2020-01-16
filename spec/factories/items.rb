FactoryBot.define do
  factory :item do
    name        {"靴"}
    size        {1}
    price       {5000}
    seller      {1}
    brand       {1}
    category    {null}
    status      {1}
    charge      {1}
    trade_step  {1}
    delivery    {1}
    prefecture  {1}
    term        {1}
  end
end
