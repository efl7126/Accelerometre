function [result] = requeteSQL(idUtilisateur)

% -------------------------------------------------------------------------
% -------------- Configuration de l'interface Matlab/mySQL ----------------
% -------------------------------------------------------------------------

%% set path
addpath(fullfile(pwd, 'queryMySQL/src'));
javaaddpath('queryMySQL/lib/mysql-connector-java-5.1.6/mysql-connector-java-5.1.6-bin.jar');

%% import classes
import MySQLDatabase;

%% create database connection
db = MySQLDatabase('localhost', 'acceleration', 'root', 'Poseidon1242');


% -------------------------------------------------------------------------
% -------------- Recueil des données de la base de données ----------------
% -------------------------------------------------------------------------

if(idUtilisateur == 0)
    db.prepareStatement('SELECT * FROM testPresentation', 10001);
    result = db.query();
else
    utilRecherche = num2str(idUtilisateur);
    commande = 'SELECT * FROM testPresentation WHERE utilisateur=';
    commande = strcat(commande,utilRecherche);
    db.prepareStatement(commande, 10001);
    result = db.query();
end   

