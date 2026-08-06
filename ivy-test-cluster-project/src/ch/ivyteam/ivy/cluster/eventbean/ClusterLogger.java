package ch.ivyteam.ivy.cluster.eventbean;

import java.io.IOException;
import java.net.InetAddress;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;

import org.apache.commons.lang3.exception.ExceptionUtils;

import ch.ivyteam.ivy.security.exec.Sudo;

public class ClusterLogger {

  public static void logBeanRunningStateChange(String beanName, boolean started) throws IOException {
    var logFile = getLogFile(beanName);
    appendString(logFile, "Bean '" + beanName + "' is '" + (started ? "STARTING" : "STOPPING") + "'");
    var detailLogfile = getDetailLogFile(beanName);
    appendString(detailLogfile, "Bean '" + beanName + "' is '" + (started ? "STARTING" : "STOPPING") + "'" + " on " + InetAddress.getLocalHost().getHostName() + "\n" + ExceptionUtils.getStackTrace(new Exception()) + "\n------------");

  }

  public static String getContentAsSystemUser(String beanName) throws Exception {
    return Sudo.call(() -> ClusterLogger.getContentAsString(beanName));
  }

  public static void deleteEventBeanLogAsSystemUser(String beanName) throws Exception {
    Sudo.run(() -> ClusterLogger.deleteEventBeanLog(beanName));
  }

  private static void deleteEventBeanLog(String beanName) {
    var outputFile = getLogFile(beanName);
    delete(outputFile);
    var detailOutputFile = getDetailLogFile(beanName);
    delete(detailOutputFile);
  }

  private static void delete(Path path) {
    if (Files.exists(path)) {
      try {
        Files.delete(path);
      } catch (IOException ex) {
        throw new RuntimeException(ex);
      }
    }
  }

  private static String getContentAsString(String beanName) throws IOException {
    var outputFile = getLogFile(beanName);
    if (Files.exists(outputFile)) {
      return Files.readString(outputFile, StandardCharsets.UTF_8);
    }
    return "";
  }

  private static void appendString(Path logFile, String message) throws IOException {
    Files.writeString(logFile, message + "\n", StandardOpenOption.APPEND);
  }

  private static Path getLogFile(String beanName) {
    return getFile("log/statechange_" + beanName + ".log");
  }

  private static Path getDetailLogFile(String beanName) {
    return getFile("log/statechange_" + beanName + "_detail.log");
  }

  private static Path getFile(String path) {
    ch.ivyteam.ivy.scripting.objects.File ivyFile = null;
    try {
      ivyFile = new ch.ivyteam.ivy.scripting.objects.File(path, false);
      ivyFile.createNewFile();
      return ivyFile.getJavaFile().toPath();
    } catch (IOException ex) {
      String file = ivyFile != null ? ivyFile.getJavaFile().getPath() : path;
      throw new RuntimeException("Could not get log file '" + file + "'", ex);
    }
  }
}
