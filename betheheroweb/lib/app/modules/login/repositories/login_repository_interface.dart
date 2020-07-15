abstract class ILoginRepository {
  Future<String> handleRegister({
    String id,
    String name,
    String email,
    String whatsapp,
    String city,
    String uf,
  });

  Future<List> handleLogin(String ongId);
}
