class Api::V1::TopicsController < ApplicationController
    before_action :set_topic, only: [:show, :update, :destroy]

    def index
        topics = Topic.order(created_at: :desc)
        render json: {status: 'Success', message: 'Returned topics', data: topics}, status: :ok
    end

    def show
        if @topic
            render json: {status: 'Success', message: 'Returned topic', data: @topic}, status: :ok
        else
            render json: {status: 'Error', message: 'Topic not found'}, status: :not_found
        end
    end

    def create
        topic = Topic.new(topic_params)
        if (topic.valid?)
            topic.save
            render json: {status: 'Success', message: 'Created topic', data: topic}, status: :ok
        else
            render json: {status: 'Error', message: 'Failed to create topic', data: topic.errors}, status: :unprocessable_entity
        end
    end

    def update
        if @topic.update_attributes(topic_params)
            render json: {status: 'Success', message: 'Updated topic', data: @topic}, status: :ok
        else
            render json: {status: 'Error', message: 'Failed to update topic', data: @topic.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        @topic.destroy
        render json: {status: 'Success', message: 'Topic destroyed'}, status: :ok
    end

    private 

    def topic_params
        params.require(:topic).permit(:name)
    end

    def set_topic
        @topic = Topic.find(params[:id])
    end

end
