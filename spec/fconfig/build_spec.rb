require 'rspec'
require 'fconfig'

describe Fconfig, '#build' do
  it 'return key value' do
    c = Fconfig.build :develop do
      env :develop do
        key 'value'
      end
    end
    expect(c.key).to eq('value')
  end

  it 'return group value' do
    c = Fconfig.build :develop do
      env :develop do
        k1 'v1'
        group1 do
          k2 'v2'
        end
      end
    end
    expect(c.k1).to eq('v1')
    expect(c.group1.k2).to eq('v2')
  end

  it 'return group value' do
    c = Fconfig.build :develop do
      env :curr do
        k1 'vp1'
        group1 do
          k2 'vp2'
          group2 do
            qqq 'kkk'
          end
        end
        k3 'vp3'
      end
      env :prod, parrent: :curr do
        k1 '!!!vp1'
        group1 do
          k2 '!!!vp2'
          group2 do
            qqq '!!!kkk'
          end
        end
        k3 '!!vp3'
      end
      env :develop, parent: :prod do
        k1 'vd1'
        group1 do
          k2 'vd2'
        end
      end
    end
    expect(c.k1).to eq('vd1')
    expect(c.group1.k2).to eq('vd2')
    expect(c.k3).to eq('!!vp3')
  end
end