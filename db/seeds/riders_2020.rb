require_relative '../../models/rider'

[
  'BERNAL Egan',
  'AMADOR Andrey',
  'CARAPAZ Richard',
  'CASTROVIEJO Jonathan',
  'KWIATKOWSKI Michał',
  'ROWE Luke',
  'SIVAKOV Pavel',
  'VAN BAARLE Dylan',
  'ROGLIČ Primož',
  'BENNETT George',
  'JANSEN Amund Grøndahl',
  'DUMOULIN Tom',
  'GESINK Robert',
  'KUSS Sepp',
  'MARTIN Tony',
  'VAN AERT Wout',
  'SAGAN Peter',
  'BUCHMANN Emanuel',
  'GROßSCHARTNER Felix',
  'KÄMNA Lennard',
  'MÜHLBERGER Gregor',
  'OSS Daniel',
  'PÖSTLBERGER Lukas',
  'SCHACHMANN Maximilian',
  'BARDET Romain',
  'CHEREL Mikaël',
  'COSNEFROY Benoît',
  'LATOUR Pierre',
  'NAESEN Oliver',
  'PETERS Nans',
  'VENTURINI Clément',
  'VUILLERMOZ Alexis',
  'ALAPHILIPPE Julian',
  'ASGREEN Kasper',
  'BENNETT Sam',
  'CAVAGNA Rémi',
  'DECLERCQ Tim',
  'DEVENYNS Dries',
  'JUNGELS Bob',
  'MØRKØV Michael',
  'PINOT Thibaut',
  'BONNET William',
  'GAUDU David',
  'KÜNG Stefan',
  'LADAGNOUS Matthieu',
  'MADOUAS Valentin',
  'MOLARD Rudy',
  'REICHENBACH Sébastien',
  'LANDA Mikel',
  'BILBAO Pello',
  'CARUSO Damiano',
  'COLBRELLI Sonny',
  'HALLER Marco',
  'MOHORIČ Matej',
  'POELS Wout',
  'VALLS Rafael',
  'URÁN Rigoberto',
  'BETTIOL Alberto',
  'CARTHY Hugh',
  'HIGUITA Sergio',
  'KEUKELEIRE Jens',
  'MARTÍNEZ Daniel Felipe',
  'POWLESS Neilson',
  'VAN GARDEREN Tejay',
  'QUINTANA Nairo',
  'ANACONA Winner',
  'BARGUIL Warren',
  'LEDANOIS Kévin',
  'QUINTANA Dayer',
  'ROSA Diego',
  'RUSSO Clément',
  'SWIFT Connor',
  'VALVERDE Alejandro',
  'CATALDO Dario',
  'ERVITI Imanol',
  'MAS Enric',
  'OLIVEIRA Nelson',
  'ROJAS José Joaquín',
  'SOLER Marc',
  'VERONA Carlos',
  'PORTE Richie',
  'EG Niklas',
  'ELISSONDE Kenny',
  'MOLLEMA Bauke',
  'PEDERSEN Mads',
  'SKUJIŅŠ Toms',
  'STUYVEN Jasper',
  'THEUNS Edward',
  'VAN AVERMAET Greg',
  'DE MARCHI Alessandro',
  'GESCHKE Simon',
  'HIRT Jan',
  'KOCH Jonas',
  'SCHÄR Michael',
  'TRENTIN Matteo',
  'ZAKARIN Ilnur',
  'MARTIN Guillaume',
  'CONSONNI Simone',
  'EDET Nicolas',
  'HERRADA Jesús',
  'LAPORTE Christophe',
  'PEREZ Anthony',
  'PÉRICHON Pierre-Luc',
  'VIVIANI Elia',
  'POGAČAR Tadej',
  'ARU Fabio',
  'DE LA CRUZ David',
  'FORMOLO Davide',
  'KRISTOFF Alexander',
  'LAENGEN Vegard Stake',
  'MARCATO Marco',
  'POLANC Jan',
  'LÓPEZ Miguel Ángel',
  'FRAILE Omar',
  'HOULE Hugo',
  'IZAGIRRE Gorka',
  'IZAGIRRE Ion',
  'LUTSENKO Alexey',
  'SÁNCHEZ Luis León',
  'TEJADA Harold',
  'EWAN Caleb',
  'CRAS Steff',
  'DE BUYST Jasper',
  'DE GENDT Thomas',
  'DEGENKOLB John',
  'FRISON Frederik',
  'GILBERT Philippe',
  'KLUGE Roger',
  'YATES Adam',
  'BAUER Jack',
  'BEWLEY Sam',
  'CHAVES Esteban',
  'IMPEY Daryl',
  'JUUL-JENSEN Christopher',
  'MEZGEC Luka',
  'NIEVE Mikel',
  'MARTIN Dan',
  'GREIPEL André',
  'HERMANS Ben',
  'HOFSTETTER Hugo',
  'NEILANDS Krists',
  'NIV Guy',
  'POLITT Nils',
  'VAN ASBROECK Tom',
  'BONIFAZIO Niccolò',
  'BURGAUDEAU Mathieu',
  'CALMEJANE Lilian',
  'COUSIN Jérôme',
  'GRELLIER Fabien',
  'SICARD Romain',
  'SOUPE Geoffrey',
  'TURGIS Anthony',
  'NIZZOLO Giacomo',
  'BOASSON HAGEN Edvald',
  'GIBBONS Ryan',
  'GOGL Michael',
  'VALGREN Michael',
  'KREUZIGER Roman',
  'POZZOVIVO Domenico',
  'WALSCHEID Max',
  'BENOOT Tiesj',
  'ARNDT Nikias',
  'BOL Cees',
  'HIRSCHI Marc',
  'KRAGH ANDERSEN Søren',
  'NIEUWENHUIS Joris',
  'PEDERSEN Casper',
  'ROCHE Nicolas',
  'COQUARD Bryan',
  'BARTHE Cyril',
  'CHEVALIER Maxime',
  'DEBUSSCHERE Jens',
  'GAUTIER Cyril',
  'PACHER Quentin',
  'REZA Kévin',
  'ROLLAND Pierre',
].each do |name|
  Rider.create!(name: name)
end