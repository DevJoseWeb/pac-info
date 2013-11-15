class Transport
  include Mongoid::Document

  def self.investiments
    Venture.collection.aggregate({ 
      '$match' => {'idn_estagio.estagio' => { '$in' => ['Em obras', 'Em execução', 'Concluído', 'Em operação'] }, 'idn_digs.Subeixo' => 'Transportes'},
      '$group' => { '_id' => {'subeixo' => '$idn_digs.Subeixo', 'data_balanco' => '$dat_ciclo'},
      'valor_total' => { '$sum'  => '$investimento_total' }, 
      'valor_total2' => {'$sum' => '$val_2011_2014'} } } )  
  end
end
