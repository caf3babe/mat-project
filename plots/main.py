from config import load
import pandas as pd
import matplotlib.pyplot as plt

def create_plot(name, timeseries, filename):
  plt.style.use('default')
  for timeserie in timeseries:
    ts = pd.read_csv(timeserie.file, parse_dates=True)
    ts[timeserie.valueColumnName].plot(label=timeserie.label, color=timeserie.color)  
  plt.title(name)
  plt.savefig(filename)
  plt.figure().clear()
  plt.close()
  plt.cla()
  plt.clf()

def main():
  config = load("config.yaml")
  for usecase in config.usecases:
    for plot in usecase.plots:
      create_plot(name=plot.name, timeseries=plot.timeseries, filename=plot.filename)

if __name__ == "__main__":
  main()
