package socket;

import express.Express;
import io.javalin.websocket.WsContext;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class Socket {

  private static final List<WsContext> userUsernameMap = new ArrayList<>();
  private static int nextUserNumber = 1;

  private final Express app;

  public Socket(Express app) {
    this.app = app;
    init();
  }

  private static void broadcastMessage(Message msg) {
    userUsernameMap.stream().filter(ctx -> ctx.session.isOpen()).forEach(socket -> {
      socket.send(msg);
    });
  }

  private void init() {
    app.ws("/chat", ws -> {
      ws.onConnect(ctx -> {
        String id = "" + nextUserNumber++;
        userUsernameMap.add(ctx);
        Message msg = new Message();
        msg.setMsg("A user joined the chat");
        msg.setId(id);
        msg.setUuid("Server");
        broadcastMessage(msg);
      });

      ws.onMessage(ctx -> {
        Message msg = ctx.message(Message.class);
        System.out.println(msg.getMsg());
        broadcastMessage(msg);
      });

    });
  }

}
