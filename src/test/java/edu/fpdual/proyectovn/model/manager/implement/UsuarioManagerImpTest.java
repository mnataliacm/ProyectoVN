package edu.fpdual.proyectovn.model.manager.implement;

import edu.fpdual.proyectovn.model.dao.Usuario;
import org.hamcrest.MatcherAssert;
import org.hamcrest.Matchers;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.stubbing.Answer;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Set;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.doReturn;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class UsuarioManagerImpTest {
  @Mock
  private Connection connection;
  @Mock
  private Statement statement;
  @Mock
  private ResultSet resultSet;
  @InjectMocks
  private UsuarioManagerImpl usuarioManager;
  @Test
  void todosUsuarios_ok() throws SQLException {
    Usuario expectedUsuario = Usuario.builder()
        .nom("Alicante")
        .ape(("Castillo"))
        .pass("natalia")
        .email("natalia@email.com")
        .movil("123")
        .id(500)
        .build();
    when(connection.createStatement()).thenReturn(statement);
    when(statement.executeQuery(any())).thenReturn(resultSet);
    when(resultSet.next()).thenAnswer(new Answer<Boolean>() {
      private int counter = 0;
      @Override
      public Boolean answer(InvocationOnMock invocationOnMock)  {
        if(counter < 1){
          counter++;
          return true;
        } else {
          return false;
        }
      }
    });
    doReturn(expectedUsuario.getId()).when(resultSet).getInt(any());
    when(resultSet.getString(any())).thenReturn(expectedUsuario.getNom());
    when(resultSet.getString(any())).thenAnswer((Answer<String>) invocationOnMock -> {

      if(invocationOnMock.getArgument(0).equals("NomUsu")){
        return expectedUsuario.getNom();
      } else if(invocationOnMock.getArgument(0).equals("ApeUsu")) {
        return expectedUsuario.getApe();
      } else if(invocationOnMock.getArgument(0).equals("Email")) {
        return expectedUsuario.getEmail();
      }else{
        return null;
      }
    });

    Set<Usuario> usuarioSet = usuarioManager.todos(connection);
    MatcherAssert.assertThat(usuarioSet, Matchers.hasSize(1));
    //MatcherAssert.assertThat(usuarioSet.iterator().next(), Matchers.is(expectedUsuario));
  }

  @Test
  void todosUsuarios_ko() throws SQLException {

    when(connection.createStatement()).thenThrow(new SQLException(""));

    Set<Usuario> usuarioSet = usuarioManager.todos(connection);

    MatcherAssert.assertThat(usuarioSet, Matchers.nullValue());

  }

}
