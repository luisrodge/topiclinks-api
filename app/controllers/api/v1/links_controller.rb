class Api::V1::LinksController < ApplicationController
    before_action :set_topic, only: :index
    before_action :set_link, only: :destroy

    def index
        links = if @topic
                    @topic.links.order(created_at: :desc)
                else
                    Link.order(created_at: :desc)
                end
        render json: {status: 'Success', message: 'Returned links', data: links}, status: :ok
    end

    def create
        link = Link.new(link_params)
        if (link.valid?)
            link.save
            render json: {status: 'Success', message: 'Created link', data: link}, status: :ok
        else
            render json: {status: 'Error', message: 'Failed to create link', data: link.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        @link.destroy
        render json: {status: 'Success', message: 'Link destroyed'}, status: :ok
    end

    private

    def link_params
        params.require(:link).permit(:title, :url, :topic_id)
    end

    def set_topic
        @topic = params[:topic_id] ? Topic.find(params[:topic_id]) : nil
    end

    def set_link
        @link = Link.find(params[:id])
    end
end
