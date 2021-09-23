package routes;

import express.Express;
import model.Home;
import model.HomeHistoryLog;
import service.HomeService;

public class HomeHistoryRoutes {

  private final Express app;

  private final HomeService homeService;
  private final Home home;
  private final HomeHistoryLog homeHistoryLog;


  public HomeHistoryRoutes(Express app) {
    this.app = app;

    this.homeService = new HomeService();
    this.home = new Home();
    this.homeHistoryLog = new HomeHistoryLog();
  }

}


