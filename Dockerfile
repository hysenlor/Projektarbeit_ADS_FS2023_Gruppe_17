# Base image
FROM jupyter/datascience-notebook:python-3.9.10


# Switch to root user
USER root

# Create a new user
ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
    && chmod -R u+rwx $HOME \
    && chown -R user:user $HOME

# Install additional Python libraries
# due to dependencie issues, docker-compose did not work with installations through requirements.txt. We added it anyways.
#ADD requirements.txt .
#RUN pip3 install -r requirements.txt
RUN pip3 install numpy 
RUN pip3 install pandas 
RUN pip3 install yfinance 
RUN pip3 install wordcloud 
RUN pip3 install tensorflow_intel 
RUN pip3 install tensorflow 
RUN pip3 install statsmodels 
RUN pip3 install seaborn 
RUN pip3 install scikit_learn 
RUN pip3 install raceplotly 
RUN pip3 install praw 
RUN pip3 install plotly 
RUN pip3 install nltk 
RUN pip3 install mysql-connector-python 
RUN pip3 install matplotlib 
RUN pip3 install keras_tuner 
RUN pip3 install keras 
RUN pip3 install beautifulsoup4 
RUN pip3 install SQLAlchemy 
RUN pip3 install Requests 
RUN pip3 install PyMySQL
RUN pip3 install tabulate
RUN pip3 install bdateutil
RUN pip3 install python-dateutil==2.7.0

# Switch to user
WORKDIR $HOME
USER user

#Add Jupyter Notebook
ADD ADS_Main.ipynb /home/user/
ADD NLP.ipynb /home/user/
ADD hot_subs.csv /home/user/
ADD top_subs.csv /home/user/