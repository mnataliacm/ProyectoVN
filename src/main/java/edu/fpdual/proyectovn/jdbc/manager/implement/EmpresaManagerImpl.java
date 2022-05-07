package edu.fpdual.proyectovn.jdbc.manager.implement;


import edu.fpdual.proyectovn.jdbc.dao.Empresa;
import edu.fpdual.proyectovn.jdbc.manager.EmpresaManager;

import java.sql.*;

public class EmpresaManagerImpl implements EmpresaManager {

    public ResultSet TodosEmpresas(Connection con) throws SQLException {
        try (Statement s = con.createStatement()) {
            ResultSet result = s.executeQuery("SELECT * FROM empresa ");
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    public ResultSet ModificarEmpresa (Connection con, String nomEmp, int idCiu, int idEmp ) throws SQLException {
        try (Statement s = con.createStatement()) {
            ResultSet result = s.executeQuery("UPDATE empresa SET "
                    + "NomEmp = '" + nomEmp
                    + "', IDCiu = '" + idCiu
                    + "' WHERE IDemp = " + idEmp);


            return result ;
        } catch (SQLException e) {
            e.printStackTrace();

            return null;
        }

    }
}
